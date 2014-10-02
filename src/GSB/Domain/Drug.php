<?php

namespace GSB\Domain;

class Drug 
{
    /**
     * Drug id.
     *
     * @var integer
     */
    private $id;

    /**
     * Copyrighting.
     *
     * @var string
     */
    private $copyrighting;

    /**
     * Trade name.
     *
     * @var string
     */
    private $tradeName;

    /**
     * Content.
     *
     * @var string
     */
    private $content;

    /**
     * Side effects.
     *
     * @var string
     */
    private $effects;

    /**
     * Contraindication.
     *
     * @var string
     */
    private $contraindication;

    /**
     * Sample price.
     *
     * @var float
     */
    private $samplePrice;

    /**
     * Family.
     *
     * @var \GSB\Domaine\Family
     */
    private $family;

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function getCopyrighting() {
        return $this->copyrighting;
    }

    public function setCopyrighting($copyrighting) {
        $this->copyrighting = $copyrighting;
    }

    public function getTradeName() {
        return $this->tradeName;
    }

    public function setTradeName($tradeName) {
        $this->tradeName = $tradeName;
    }

    public function getContent() {
        return $this->content;
    }

    public function setContent($content) {
        $this->content = $content;
    }

    public function getEffects() {
        return $this->effects;
    }

    public function setEffects($effects) {
        $this->effects = $effects;
    }

    public function getContraindication() {
        return $this->contraindication;
    }

    public function setContraindication($contraindication) {
        $this->contraindication = $contraindication;
    }

    public function getSamplePrice() {
        return $this->samplePrice;
    }

    public function setSamplePrice($samplePrice) {
        $this->samplePrice = $samplePrice;
    }

    public function getFamily() {
        return $this->family;
    }

    public function setFamily($family) {
        $this->family = $family;
    }
}