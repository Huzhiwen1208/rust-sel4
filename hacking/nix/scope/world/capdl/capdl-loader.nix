{ runCommand
, capdl-tool
, objectSizes
, mkTask, crates
, crateUtils
, seL4RustEnvVars
, seL4RustTargetInfoWithConfig
}:

let
  seL4Modifications = crateUtils.elaborateModifications {
    modifyDerivation = drv: drv.overrideAttrs (self: super: seL4RustEnvVars);
  };

in mkTask {

  rootCrate = crates.capdl-loader;

  rustTargetInfo = seL4RustTargetInfoWithConfig { minimal = true; };

  release = false;

  extraProfile = {
    opt-level = 1; # bug on 2
  };

  # layers = [
  #   crateUtils.defaultIntermediateLayer
  #   {
  #     crates = [ "capdl-loader-core" ];
  #     modifications = seL4Modifications;
  #   }
  # ];

}