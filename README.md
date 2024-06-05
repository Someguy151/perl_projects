# My Perl Projects

## Overview
This project contains a collection of Perl scripts and modules for various operations, including file handling, HTML generation, and database interactions. The scripts are organized into executable scripts, modules, input data files, and output files.

## Directory Structure
- `bin/`: Executable scripts.
- `lib/`: Perl modules.
- `data/`: Input data files.
- `Outputs/`: Output files.
- `.vscode/`: VSCode settings.
- `t/`: Test scripts (recommended).
- `docs/`: Documentation (recommended).
- `config/`: Configuration files (recommended).

## Setup
1. **Clone the repository:**
   
```sh
git clone https://github.com/Someguy151/my_perl_project.git
cd my_perl_project
```

2. **Install necessary Perl modules:**

```sh
cpanm --installdeps .
```

## Usage
- To run a specific script, use the Perl interpreter:

```sh
perl bin/HTMLFormatted.pl
```

### Scripts
- **ExcelFormatting.pl**: Script for formatting Excel files.
- **ExcelOperations.pl**: Script for performing various operations on Excel files.
- **FileOperations.pl**: Script for file handling operations.
- **hello.pl**: A simple hello world script.
- **HTMLFormatted.pl**: Script for generating formatted HTML content.
- **PerlBasics.pl**: Basic Perl script demonstrating fundamental Perl features.
- **RegularExpressions.pl**: Script demonstrating the use of regular expressions in Perl.
- **SQLOperations.pl**: Script for performing SQL operations.

### Modules
- **MyApp::FileOperations**: Module for file operations.
- **MyApp::HTMLHandler**: Module for handling and generating HTML content.

### Example
Here’s how you can use the `HTMLFormatted.pl` script:

```sh
perl bin/HTMLFormatted.pl
```

This will generate an HTML file at `Outputs/output_html.html`.

## Contributing
1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Create a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
