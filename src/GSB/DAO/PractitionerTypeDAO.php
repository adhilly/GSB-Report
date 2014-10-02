<?php

namespace GSB\DAO;

use GSB\Domain\PractitionerType;

class PractitionerTypeDAO extends DAO
{
    /**
     * Returns the list of all families, sorted by name.
     *
     * @return array The list of all families.
     */
    public function findAll() {
        $sql = "select * from Practitioner_type order by Practitioner_type_name";
        $result = $this->getDb()->fetchAll($sql);
        
        // Converts query result to an array of domain objects
        $PractitionerTypes = array();
        foreach ($result as $row) {
            $PractitionerTypeId = $row['practitioner_type_id'];
            $PractitionerTypes[$PractitionerTypeId] = $this->buildDomainObject($row);
        }
        return $PractitionerTypes;
    }

    /**
     * Returns the family matching the given id.
     *
     * @param integer $id The family id.
     *
     * @return \GSB\Domain\Family|throws an exception if no family is found.
     */
    public function find($id) {
        $sql = "select * from practitioner_type where Practitioner_type_id=?";
        $row = $this->getDb()->fetchAssoc($sql, array($id));

        if ($row)
            return $this->buildDomainObject($row);
        else
            throw new \Exception("No Practitioner_type found for id " . $id);
    }

    /**
     * Creates a Family instance from a DB query result row.
     *
     * @param array $row The DB query result row.
     *
     * @return \GSB\Domain\PractitionerType
     */
    protected function buildDomainObject($row) {
        $practitioner_type = new PractitionerType();
        $practitioner_type->setId($row['practitioner_type_id']);
        $practitioner_type->setName($row['practitioner_type_name']);
        $practitioner_type->setPlace($row['practitioner_type_place']);
        return $practitioner_type;
    }
}
