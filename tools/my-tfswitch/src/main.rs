use std::env;
use std::io::Result;
use std::io::{self, Write};
use std::process::Command;

fn main() -> Result<()> {
    let args: Vec<String> = env::args().skip(1).collect();

    let _ = Command::new("/usr/local/bin/tfswitch")
        .output()
        .expect("failed to get Terraform binary");

    println!("{:?}", args);
    let output = Command::new("terraform")
        .args(args)
        .output()
        .expect("failed to get Terraform binary");
    io::stdout().write_all(&output.stdout).unwrap();
    io::stdout().write_all(&output.stderr).unwrap();

    Ok(())
}
