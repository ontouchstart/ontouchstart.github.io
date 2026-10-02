use std::env;
use std::fs;
use std::path::Path;
use walkdir::WalkDir;

fn main() {
    let args: Vec<String> = env::args().collect();
    // The first argument is the program name, so the source path is the first user-provided argument.
    // If no argument is provided, default to /react.
    let source_path_str = if args.len() > 1 {
        &args[1]
    } else {
        "/react"
    };

    let root = Path::new(source_path_str);
    // The exclusion logic remains the same, but it should be relative to the root or absolute.
    // Since the user might pass a relative path that resolves to /react, we should resolve it to an absolute path first.
    let absolute_root = fs::canonicalize(root).expect("Failed to resolve source path");
    
    // The excluded directory is /react/compiler.
    // We want to exclude it even if the user passes a relative path that resolves to /react.
    let exclude = Path::new("/react/compiler");

    let mut files = Vec::new();

    for entry in WalkDir::new(&absolute_root).into_iter().filter_map(|e| e.ok()) {
        let path = entry.path();
        
        // Check if the path is within the excluded directory.
        if let Ok(canonical_path) = fs::canonicalize(path) {
            if canonical_path.starts_with(exclude) {
                continue;
            }
        }

        if path.is_file() {
            files.push(path.to_path_buf());
        }
    }

    // Sort lexicographically for determinism.
    files.sort();

    for file in files {
        println!("{}", file.display());
    }
}
