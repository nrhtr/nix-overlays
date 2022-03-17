{ lib
, buildPythonPackage
, fetchPypi
, pbr
, cliff
, debtcollector
, iso8601
, netaddr
, osc-lib
, os-client-config
, oslo-i18n
, oslo-log
, oslo-serialization
, oslo-utils
, keystoneauth1
, python-keystoneclient
, requests
, simplejson
}:

buildPythonPackage rec {
  pname = "python-neutronclient";
  version = "7.8.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-m8ZrKVKRLCuimNTISS24l6Xq/LDs91fje6ppG3C0e04=";
  };

  propagatedBuildInputs = [
    pbr
    cliff
    debtcollector
    iso8601
    netaddr
    osc-lib
    os-client-config
    oslo-i18n
    oslo-log
    oslo-serialization
    oslo-utils
    keystoneauth1
    python-keystoneclient
    requests
    simplejson
  ];

  pythonImportsCheck = [ "neutronclient" ];

  doCheck = false;
  doInstallCheck = false;

  meta = with lib; {
    description = "Client library for OpenStack Compute API";
    homepage = "https://github.com/openstack/python-neutronclient";
    license = licenses.asl20;
    maintainers = teams.openstack.members;
  };
}
