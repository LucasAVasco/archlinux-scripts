package main

import (
	"fmt"
	"os"
	"path/filepath"
)

func main() {
	err := run()
	if err != nil {
		panic(err)
	}
}

func run() error {
	level := os.Args[1]

	// Validation
	if level != "low" && level != "high" && level != "auto" {
		return fmt.Errorf("invalid level: %s", level)
	}

	// Get the performance level files
	files, err := filepath.Glob("/sys/class/drm/card*/device/power_dpm_force_performance_level")
	if err != nil {
		return fmt.Errorf("failed to get files: %w", err)
	}

	// Set the performance level
	for _, file := range files {
		err := os.WriteFile(file, []byte(level), 0644)
		if err != nil {
			return fmt.Errorf("failed to set performance level for %s: %w", file, err)
		}
	}

	return nil
}
