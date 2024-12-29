package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"
)

const delay = time.Duration(float64(time.Second) * 0.6039604)

const (
	ansiUp              = "\x1b[A"
	ansiBeginningOfLine = "\x1b[G"
	ansiClearLine       = "\x1b[K"
	ansiGrey            = "\x1b[90m"
	ansiReset           = "\x1b[0m"
)

func main() {
	bytes, err := os.ReadFile("2222.txt")
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	words := strings.Split(string(bytes), "\n")

	do2222(words)
}

func do2222(words []string) {
	ticker := time.NewTicker(delay)
	index := 0
	mistakes := 0
	printState := func() {
		word := strings.ToLower(words[index])
		percentage := strconv.FormatFloat(((float64(index) / float64(len(words))) * 100), 'f', 3, 64)
		s := "s"
		if mistakes == 1 {
			s = ""
		}
		fmt.Printf("%s%s%s · %s%% · %d mistake%s%s%s",
			ansiBeginningOfLine, word, ansiGrey, percentage, mistakes, s, ansiReset, ansiClearLine)
		index++
	}
	fmt.Printf("2222")

	stdinReader := bufio.NewReader(os.Stdin)
	hitEnter := make(chan struct{})
	go func() {
		for {
			b, _ := stdinReader.ReadByte()
			if b == '\n' {
				fmt.Print(ansiUp)
				hitEnter <- struct{}{}
			}
		}
	}()

	canMakeMistake := false
	for {
		select {
		case <-hitEnter:
			if canMakeMistake {
				mistakes++
				canMakeMistake = false
			}
		case <-ticker.C:
			if index == len(words) {
				s := "s"
				if mistakes == 1 {
					s = ""
				}
				fmt.Printf("%s2222 · %d mistake%s%s\n",
					ansiBeginningOfLine, mistakes, s, ansiClearLine)
				return
			}
			canMakeMistake = true
			printState()
		}
	}
}
