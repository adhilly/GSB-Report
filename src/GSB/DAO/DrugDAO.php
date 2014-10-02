<?php

namespace GSB\DAO;

use GSB\Domain\Drug;

class DrugDAO extends DAO
{
    /**
     * @var \GSB\DAO\FamilyDAO
     */
    private $familyDAO;

    public function setFamilyDAO($familyDAO) {
        $this->familyDAO = $familyDAO;
    }

    /**
     * Returns the list of all drugs, sorted by trade name.
     *
     * @return array The list of all drugs.
     */
    public function findAll() {
        $sql = "select * from drug order by trade_name";
        $result = $this->getDb()->fetchAll($sql);
        
        // Converts query result to an array of domain objects
        $drugs = array();
        foreach ($result as $row) {
            $drugId = $row['drug_id'];
            $drugs[$drugId] = $this->buildDomainObject($row);
        }
        return $drugs;
    }

    /**
     * Returns the list of all drugs for a given family, sorted by trade name.
     *
     * @param integer $familyDd The family id.
     *
     * @return array The list of drugs.
     */
    public function findAllByFamily($familyId) {
        $sql = "select * from drug where family_id=? order by trade_name";
        $result = $this->getDb()->fetchAll($sql, array($familyId));
        
        // Convert query result to an array of domain objects
        $drugs = array();
        foreach ($result as $row) {
            $drugId = $row['drug_id'];
            $drugs[$drugId] = $this->buildDomainObject($row);
        }
        return $drugs;
    }

    /**
     * Returns the drug matching a given id.
     *
     * @param integer $id The drug id.
     *
     * @return \GSB\Domain\Drug|throws an exception if no drug is found.
     */
    public function find($id) {
        $sql = "select * from drug where drug_id=?";
        $row = $this->getDb()->fetchAssoc($sql, array($id));

        if ($row)
            return $this->buildDomainObject($row);
        else
            throw new \Exception("No drug found for id " . $id);
    }

    /**
     * Creates a Drug instance from a DB query result row.
     *
     * @param array $row The DB query result row.
     *
     * @return \GSB\Domain\Drug
     */
    protected function buildDomainObject($row) {
        $familyId = $row['family_id'];
        $family = $this->familyDAO->find($familyId);

        $drug = new Drug();
        $drug->setId($row['drug_id']);
        $drug->setCopyrighting($row['copyrighting']);
        $drug->setTradeName($row['trade_name']);
        $drug->setContent($row['content']);
        $drug->setEffects($row['effects']);
        $drug->setContraindication($row['contraindication']);
        $drug->setSamplePrice($row['sample_price']);
        $drug->setFamily($family);
        return $drug;
    }
}