{ lib
, buildPythonPackage
, fetchPypi
, pbr
, prettytable
, requests
, simplejson
, oslo-i18n
, oslo-utils
, keystoneauth1
, python-swiftclient
, python-mistralclient
, osc-lib
, python-openstackclient
}:

buildPythonPackage rec {
  pname = "python-troveclient";
  version = "7.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-TuvV1wqQWcZgX80bx7ZbSXoiBcid/W3lBNU3KiI8t2o";
  };

  propagatedBuildInputs = [
    pbr
    prettytable
    requests
    simplejson
    oslo-i18n
    oslo-utils
    keystoneauth1
    python-swiftclient
    python-mistralclient
    osc-lib
    python-openstackclient
  ];

  pythonImportsCheck = [ "troveclient" ];

  doCheck = false;
  doInstallCheck = false;

  meta = with lib; {
    description = "OpenStack Database as a Service (Trove) Client";
    homepage = "https://github.com/openstack/python-troveclient";
    license = licenses.asl20;
    maintainers = teams.openstack.members;
  };
}
