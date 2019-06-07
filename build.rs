fn main() {
    println!("cargo:rustc-link-search=native=c:/devkitPro/MLlib/lib");
    println!("cargo:rustc-link-lib=static=MLlib");
    println!("cargo:rustc-link-search=native=c:/devkitPro/libogc/lib/wii");
    println!("cargo:rustc-link-lib=static=wiiuse");
    println!("cargo:rustc-link-lib=static=ogc");
}
