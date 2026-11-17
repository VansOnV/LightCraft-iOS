<<<<<<< HEAD
(your local changes)
=======
(remote repository changes)
>>>>>>> origin/main

# LightCraft iOS (scaffold)

Rust FFI crate (UniFFI) + SwiftUI shell, built into an unsigned .ipa by GitHub Actions.

## Setup
1. Create a new GitHub repo and push this folder.
2. Add the engine: `git submodule add https://github.com/storytold/lightcraft vendor/lightcraft`
3. In `ffi/Cargo.toml`, uncomment the engine dependency and fix the path to the real crate name.
4. In `ffi/src/lib.rs`, replace the `process_image` stub with real engine calls.
5. Actions tab -> "Build unsigned IPA" -> Run workflow -> download the artifact.

## Install from Windows
Install iTunes + iCloud (from apple.com, not the Microsoft Store), open Sideloadly,
plug in the iPhone, drag in LightCraft.ipa, sign in with your Apple ID, Start.
On the phone: Settings > General > VPN & Device Management > trust your Apple ID.
Free accounts: re-sign every 7 days.
