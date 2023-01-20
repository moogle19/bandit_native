use rustler::Binary;
use rustler::Env;
use rustler::Error;
use rustler::NifResult;
use rustler::OwnedBinary;

#[rustler::nif]
fn mask<'a>(env: Env<'a>, payload: Binary<'a>, mask_value: u32) -> NifResult<Binary<'a>> {
    let mut owned: OwnedBinary = payload
        .to_owned()
        .ok_or(Error::Term(Box::new("no memory")))?;

    let mask_bytes = mask_value.to_be_bytes();
    let mut i = 0;
    for byte in owned.as_mut_slice() {
        *byte ^= mask_bytes[i];
        i = (i + 1) % 4;
    }

    Ok(Binary::from_owned(owned, env))
}

#[rustler::nif]
fn valid_utf8(string: Binary) -> bool {
    simdutf8::basic::validate_utf8(string.as_slice())
}

rustler::init!("Elixir.Bandit.Native", [mask, valid_utf8]);
