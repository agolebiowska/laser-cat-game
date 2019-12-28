build:
	docker run --rm \
	-v `pwd`/src:/game \
	--env GOOS=js --env GOARCH=wasm \
	golang:1.13 \
	/bin/bash -c "go build -o /game/game.wasm /game/main.go; cp /usr/local/go/misc/wasm/wasm_exec.js /game/wasm_exec.js"

serve:
	(sleep 2 && open http://localhost:8080) &
	docker run --rm -p 8080:8043 -v `pwd`/src:/srv/http pierrezemb/gostatic:latest
