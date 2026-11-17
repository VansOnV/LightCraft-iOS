uniffi::setup_scaffolding!();

#[uniffi::export]
pub fn engine_version() -> String {
    format!("lightcraft-ffi {}", env!("CARGO_PKG_VERSION"))
}

/// Placeholder: takes encoded image bytes (JPEG/PNG) and an exposure value,
/// returns encoded bytes. TODO: call the real LightCraft develop pipeline here.
#[uniffi::export]
pub fn process_image(data: Vec<u8>, _exposure: f32) -> Vec<u8> {
    data
}
