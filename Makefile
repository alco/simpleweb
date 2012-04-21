all: app elixir

# Recompile only Elixir code and run the app
run: elixir
	./start.sh

# Fetch deps and compile src/*.app.src
app: get-deps
	@./rebar compile

get-deps:
	@./rebar get-deps

# Remove Elixir build products
clean:
	rm -rf __MAIN__
	rm -rf ebin

# Remove all build products including dependencies
dist-clean: clean
	@./rebar clean
	rm -f erl_crash.dump

elixir: src/*
	rm -rf __MAIN__
	elixirc -pa 'deps/*/ebin' src/*.ex
