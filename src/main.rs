#![no_std] // don't link to std lib

// Disable rust entry points
// Also need ot disable c entry points via .cargo/config.toml
#![no_main] 

use core::panic::PanicInfo;

// Don't mangle _start
#[no_mangle]
pub extern "C" fn _start() -> ! {
    loop {}
}

// Create panic handler
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
