<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'config.php';

$xslDoc = new DOMDocument();
$xslDoc->load('xsl/'.$default['xsl'].'.xsl');

$xmlDoc = new DOMDocument();
$xmlDoc->load('xml/'.$default['xml'].'.xml');

$proc = new XSLTProcessor();
$proc->importStylesheet($xslDoc);
echo $proc->transformToXML($xmlDoc);

