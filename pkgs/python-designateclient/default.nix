{ lib
, buildPythonPackage
, fetchPypi
, cliff
, jsonschema
, osc-lib
, oslo-serialization
, oslo-utils
, pbr
, keystoneauth1
, requests
, stevedore
, debtcollector
}:

buildPythonPackage rec {
  pname = "python-designateclient";
  version = "4.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-5VEznVVDPjGUDwehAsGiI3Mzef89VyLPKMrRSJwjwLc=";
  };

  propagatedBuildInputs = [
    cliff
    jsonschema
    osc-lib
    oslo-serialization
    oslo-utils
    pbr
    keystoneauth1
    requests
    stevedore
    debtcollector
  ];

  pythonImportsCheck = [ "designateclient" ];

  doCheck = false;
  doInstallCheck = false;

  meta = with lib; {
    description = "Python bindings to the Designate API";
    homepage = "https://github.com/openstack/python-designateclient";
    license = licenses.asl20;
    maintainers = teams.openstack.members;
  };
}
