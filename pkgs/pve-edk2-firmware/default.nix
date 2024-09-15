{ lib, pkg-config, stdenv, fetchgit, fetchurl, ... }:

stdenv.mkDerivation rec {
    pname = "pve-edk2-firmware";
    version = "2024.05.1";
  

    src = fetchurl {
      url = "http://ftp.debian.org/debian/pool/main/e/edk2/ovmf_2024.05-2_all.deb";
      sha256 = "sha256-A5MK+7fy9VO425tMBSnIWJ44AOqKktrB1hiTlhRJ1q8=";
    };

    unpackPhase = ''
      ar x $src
      tar -xvf data.tar.xz
    '';

    buildInputs = [ ];

    nativeBuildInputs = [ ];

    installPhase = ''
      TARGET=$out/usr/share/pve-edk2-firmware
      mkdir -p $TARGET
      cp -r usr/share/OVMF/* $TARGET
    '';

    meta = {
      description = "pve-edk2-firmware 4M for UEFI bios firmwares";
      homepage = "";
      maintainers = with lib.maintainers; [ ];
    };
}
