use std::env;
use std::io::Result;
use std::process::Command;

fn main() -> Result<()> {
    let args: Vec<String> = env::args().skip(1).collect();

    let _ = Command::new("/usr/local/bin/tfswitch")
        .output()
        .expect("failed to get Terraform binary");

    let _status = Command::new("terraform")
        .args(args)
        .status()
        .expect("failed to get Terraform binary");

    Ok(())
}
