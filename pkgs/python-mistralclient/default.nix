{ lib
, buildPythonPackage
, fetchPypi
, cliff
, osc-lib
, oslo-i18n
, oslo-utils
, oslo-serialization
, pbr
, keystoneauth1
, pyyaml
, requests
, stevedore
}:

buildPythonPackage rec {
  pname = "python-mistralclient";
  version = "4.4.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-0KoF8XUcum+QbXyAU/9B2hTcg6mCkd3aV0s+qTtdSyA";
  };

  propagatedBuildInputs = [
    cliff
    osc-lib
    oslo-i18n
    oslo-utils
    oslo-serialization
    pbr
    keystoneauth1
    pyyaml
    requests
    stevedore
  ];

  pythonImportsCheck = [ "mistralclient" ];

  doCheck = false;
  doInstallCheck = false;

  meta = with lib; {
    description = "Python client for Mistral REST API. Includes python library for Mistral API and Command Line Interface (CLI) library.";
    homepage = "https://github.com/openstack/python-mistralclient";
    license = licenses.asl20;
    maintainers = teams.openstack.members;
  };
}
