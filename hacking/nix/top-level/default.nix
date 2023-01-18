self: with self; {

  everything = [
    pkgs.host.aarch64.none.this.worlds.default.test.full-runtime.run
    pkgs.host.aarch64.none.this.worlds.default.test.minimal-runtime-with-state.run
    pkgs.host.x86_64.none.this.worlds.default.test.minimal-runtime-with-state.run
    pkgs.host.riscv64.none.this.worlds.default.kernel
  ];

  example = pkgs.host.aarch64.none.this.worlds.default.test.full-runtime.run;

}