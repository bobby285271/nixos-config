{ pkgs, ... }:

let
  my-python-packages = python3Packages: with pkgs.python3Packages; [
    autopep8
    boto3
    gitpython
    pandas
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
