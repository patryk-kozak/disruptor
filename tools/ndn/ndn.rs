use std::process::Command;

fn exec_bazel(log_name: String) -> ! {
    let exec = Command::new("bazel")
        .arg("build")
        .arg("--execution_log_json_file")
        .arg(log_name)
        .spawn()
        .expect("bazel failed to start");

    println!("status: {}", exec.status);
    println!("stdout: {}", String::from_utf8_lossy(&exec.stdout));
    println!("stderr: {}", String::from_utf8_lossy(&exec.stderr));
}

fn clean_bazel() {

}

fn main() {

    exec_bazel("log_file_1.txt")

}