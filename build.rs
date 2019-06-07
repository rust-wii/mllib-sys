fn main() {
    let dkp_path = std::env::var("DEVKITPRO").unwrap();
    println!("cargo:rustc-link-search=native={}/MLlib/lib", dkp_path);
    println!("cargo:rustc-link-lib=static=MLlib");
    println!("cargo:rustc-link-search=native={}/libogc/lib/wii", dkp_path);
    println!("cargo:rustc-link-lib=static=wiiuse");
    println!("cargo:rustc-link-lib=static=ogc");
}
