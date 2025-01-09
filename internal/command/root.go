package command

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "omni",
	Short: "OmniCore - Modern Web & API Security Scanner Platform",
	Long: `🚀️ OmniCore is a community-driven security scanning platform developed 
for modern web applications and APIs.

Core Features:
  🔍 Core Scanning Engine
  - Automated security scanning for web applications
  - API endpoint security checks
  - OWASP Top 10 vulnerability scanning
  - Parallel scanning support

  🔌 Plugin System
  - Plugin development API in Go
  - Secure plugin loading and execution
  - Version control and compatibility

  📊 Reporting
  - Detailed security reports
  - Multiple format support (HTML, PDF, JSON)
  - Risk prioritization`,
	Run: func(cmd *cobra.Command, args []string) {
		// Default behavior when no subcommand is provided
		cmd.Help()
	},
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func init() {
	// Global flags can be added here
	rootCmd.PersistentFlags().StringP("config", "c", "", "config file (default is $HOME/.omni.yaml)")
	rootCmd.PersistentFlags().StringP("output", "o", "", "output format (html, pdf, json)")
	rootCmd.PersistentFlags().BoolP("verbose", "v", false, "enable verbose output")
}
