const WORDS: &'static str = include_str!("../2222.txt");

fn main() {
    for line in WORDS.lines() {
        println!("{line}");
        std::thread::sleep(std::time::Duration::from_nanos(603_960_400));
    }
}
