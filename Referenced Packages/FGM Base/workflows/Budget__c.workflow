<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FGM_Set_Budget_Name</fullName>
        <field>Name</field>
        <formula>Program__r.Name &amp;  &quot; - &quot; &amp; TEXT(Fiscal_Year__c)</formula>
        <name>FGM - Set Budget Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FGM - Set Budget Name</fullName>
        <actions>
            <name>FGM_Set_Budget_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Budget__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Sets Budget to &quot;[Program] - [Fiscal Year]&quot;.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
