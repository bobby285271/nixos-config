{ pkgs, ... }:

let
  my-python-packages = python3Packages: with pkgs.python3Packages; [
    autopep8
    GitPython
    pandas
    pyqt5
    pip
    requests
  ];
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in
{
  environment.systemPackages = with pkgs; [
    python-with-my-packages
  ];
}
