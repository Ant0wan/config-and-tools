use std::env;
use std::io::Result;
use std::io::{self, Write};
use std::process::Command;

fn main() -> Result<()> {
    let args: Vec<String> = env::args().collect();
    let _ = Command::new("/usr/local/bin/tfswitch")
        .arg(&args[1])
        .output()
        .expect("failed to get Terraform binary");

    let output = Command::new("terraform")
        .arg("-v")
        .output()
        .expect("failed to get Terraform binary");
    io::stdout().write_all(&output.stdout).unwrap();

    Ok(())
}
