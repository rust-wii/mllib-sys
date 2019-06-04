fn main() {
    println!("cargo:rustc-link-search=native=C:/devkitPro/MLlib/lib");
    println!("cargo:rustc-link-lib=static=MLlib");
}
