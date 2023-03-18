{
	description = "A very basic flake";

	inputs.nixpkgs.url = "github:illustris/nixpkgs/lightgbm-gpu";
	outputs = { self, nixpkgs }: {

		packages = nixpkgs.lib.genAttrs [
			"x86_64-linux" "aarch64-linux"
			"x86_64-darwin" "aarch64-darwin"
		] (sys: with nixpkgs.legacyPackages.${sys}; rec {
			inherit (python3Packages) lightgbm;
			pyWithLightgbm = python3.withPackages (p: with p; [
				lightgbm
			]);
			checkScript = writeScriptBin "checkScript" "${pyWithLightgbm}/bin/python ${./check.py}";
			default = checkScript;
		});

	};
}
