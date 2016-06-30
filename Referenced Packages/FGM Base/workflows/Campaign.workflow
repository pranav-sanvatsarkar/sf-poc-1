<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FGM_Set_to_Active</fullName>
        <field>IsActive</field>
        <literalValue>1</literalValue>
        <name>FGM - Set Docket to Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FGM - Set to Active</fullName>
        <actions>
            <name>FGM_Set_to_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Sets Docket to active when it is created. This rule was implemented to overcome a common end user mistake.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
