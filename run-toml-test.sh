#!/usr/bin/env bash

# requires TOML test binary
# go install github.com/toml-lang/toml-test/v2/cmd/toml-test@latest

skip_decode=(
    -skip='valid/key/quoted-unicode'
	-skip='invalid/encoding/bad-utf8-in-comment'
	-skip='invalid/encoding/bad-codepoint'
)

skip_encode=(
	-skip='encoder/key/quoted-unicode'
	-skip='encoder/spec-1.0.0/float-1'
	-skip='encoder/float/max-int'
	-skip='encoder/float/long'
)

e=0
toml-test test -toml=1.0 "${skip_decode[@]}" "${skip_encode[@]}" -decoder='php ./toml-test-decode.php' -encoder='php ./toml-test-encode.php' || e=1
exit $e
