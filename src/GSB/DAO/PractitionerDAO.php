<?php

namespace GSB\DAO;

use GSB\Domain\Practitioner;

class PractitionerDAO extends DAO
{
    /**
     * @var \GSB\DAO\PractitionerTypeDAO
     */
    private $practitioner_typeDAO;

    public function setPractitioner_typeDAO($practitioner_typeDAO) {
        $this->practitioner_typeDAO = $practitioner_typeDAO;
    }

    /**
     * Returns the list of all drugs, sorted by trade name.
     *
     * @return array The list of all drugs.
     */
    public function findAll() {
        $sql = "select * from practitioner order by practitioner_name";
        $result = $this->getDb()->fetchAll($sql);
        
        // Converts query result to an array of domain objects
        $practitioner = array();
        foreach ($result as $row) {
            $practitionerId = $row['practitioner_id'];
            $practitioner[$practitionerId] = $this->buildDomainObject($row);
        }
        return $practitioner;
    }

    /**
     * Returns the list of all drugs for a given family, sorted by trade name.
     *
     * @param integer $familyDd The family id.
     *
     * @return array The list of drugs.
     */
    public function findAllByPractitioner_type($practitioner_typeId) {
        $sql = "select * from practitioner where practitioner_type_id=? order by practitioner_name";
        $result = $this->getDb()->fetchAll($sql, array($practitioner_typeId));
        
        // Convert query result to an array of domain objects
        $practitioner = array();
        foreach ($result as $row) {
            $practitionerId = $row['practitioner_id'];
            $practitioner[$practitionerId] = $this->buildDomainObject($row);
        }
        return $practitioner;
    }

    /**
     * Returns the drug matching a given id.
     *
     * @param integer $id The drug id.
     *
     * @return \GSB\Domain\Drug|throws an exception if no drug is found.
     */
    public function find($id) {
        $sql = "select * from practitioner where practitioner_id=?";
        $row = $this->getDb()->fetchAssoc($sql, array($id));

        if ($row)
            return $this->buildDomainObject($row);
        else
            throw new \Exception("No practitioner found for id " . $id);
    }

    /**
     * Creates a Drug instance from a DB query result row.
     *
     * @param array $row The DB query result row.
     *
     * @return \GSB\Domain\Drug
     */
    protected function buildDomainObject($row) {
        $practitioner_typeId = $row['practitioner_type_id'];
        $practitioner_type = $this->practitioner_typeDAO->find($practitioner_typeId);

        $practitioner = new Practitioner();
        $practitioner->setId($row['practitioner_id']);
        $practitioner->setPractitionerName($row['practitioner_name']);
        $practitioner->setPractitionerFirstName($row['practitioner_first_name']);
        $practitioner->setPractitionerAddress($row['practitioner_address']);
        $practitioner->setPractitionerZip($row['practitioner_zip_code']);
        $practitioner->setPractitionerCity($row['practitioner_city']);
        $practitioner->setTypeId($practitioner_type);
        $practitioner->setNotoriety($row['notoriety_coefficient']);
        return $practitioner;
    }
}
