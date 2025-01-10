# 🚀 OmniCore Installer Guide

## 🌟 Overview

This guide provides detailed instructions for installing OmniCore on different operating systems. OmniCore offers both automated and manual installation methods to suit your needs.

## 🛠️ Automated Installation (Recommended)

### 🐧 Linux
```bash
curl -sSL https://raw.githubusercontent.com/rasperon/omnicore/main/installers/install.sh | bash
```

### 🪟 Windows
1. Open PowerShell as Administrator
2. Run the following command:
```powershell
iwr -useb https://raw.githubusercontent.com/rasperon/omnicore/main/installers/install.ps1 | iex
```

## 📦 Manual Installation

### Prerequisites
- Go 1.21 or later
- Git

### Steps
1. Clone the repository:
```bash
git clone https://github.com/rasperon/omnicore.git
```

2. Navigate to the project directory:
```bash
cd omnicore
```

3. Install dependencies:
```bash
go mod download
```

4. Build the project:
   
For Linux/macOS:
```bash
go build -o omnicore cmd/omni/main.go
```

For Windows:
```bash
go build -o omnicore.exe cmd/omni/main.go
```

5. Add to PATH (Optional):
   - Linux/macOS: Move the binary to `/usr/local/bin` or `~/.local/bin`
   - Windows: Add the binary location to your system's PATH environment variable

## ✅ Verification

To verify the installation, open a new terminal and run:
```bash
omnicore --version
```

## 🔧 Troubleshooting

### Common Issues

1. **Go Not Installed**
   - Error: "Go is not installed"
   - Solution: Install Go from [official website](https://golang.org/doc/install)

2. **Permission Denied**
   - Linux/macOS: Run with `sudo` or check file permissions
   - Windows: Run PowerShell as Administrator

3. **PATH Issues**
   - Restart your terminal after installation
   - Verify PATH environment variable includes installation directory

## 🆘 Support

If you encounter any issues during installation:
- Check our [FAQ](docs/faq.md)
- Join our [Discord](https://discord.gg/rWcEyWRMFc)
- Report issues on [GitHub](https://github.com/rasperon/omnicore/issues)

---

<div align="center">
    <p>Made with ❤️ by OmniCore Security Community</p>
</div> 