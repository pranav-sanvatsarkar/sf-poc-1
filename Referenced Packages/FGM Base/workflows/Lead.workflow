<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FGM_Set_Approved_Date</fullName>
        <field>Approval_Date__c</field>
        <formula>TODAY()</formula>
        <name>FGM - Set Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FGM_Set_Days_Since_Last_Status_Update</fullName>
        <field>Date_of_Last_Status_Change__c</field>
        <formula>Today()</formula>
        <name>FGM - Set Days Since Last Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FGM_Set_Declined_Date</fullName>
        <description>If Status is set to &apos;Declined&apos;, then Decline Date is populated with the current date.</description>
        <field>Decline_Date__c</field>
        <formula>TODAY()</formula>
        <name>FGM - Set Declined Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FGM_Set_Duration_if_Start_and_End_Date</fullName>
        <field>Duration_Months__c</field>
        <formula>ROUND((End_Date__c - Start_Date__c)/30.5,0)</formula>
        <name>FGM - Set Duration if Start and End Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FGM_Set_End_Date_if_Duration_is_Known</fullName>
        <description>Start_Date__c + (30.42 * Duration_in_Months__c )</description>
        <field>End_Date__c</field>
        <formula>Start_Date__c + (30.42 * Duration_Months__c )</formula>
        <name>FGM - Set End Date if Duration is Known</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FGM - Set Approved Date</fullName>
        <actions>
            <name>FGM_Set_Approved_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Application Invited</value>
        </criteriaItems>
        <description>If Status is set to &apos;Application Invited&apos;, then Approval Date is populated with the current date.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FGM - Set Days Since Last Status Update</fullName>
        <actions>
            <name>FGM_Set_Days_Since_Last_Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Status)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FGM - Set Declined Date</fullName>
        <actions>
            <name>FGM_Set_Declined_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Decline_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Declined</value>
        </criteriaItems>
        <description>If Status is set to &apos;Declined&apos;, then Decline Date is populated with the current date.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FGM - Set Duration if Start and End Date are Known</fullName>
        <actions>
            <name>FGM_Set_Duration_if_Start_and_End_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.End_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Duration_Months__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FGM - Set End Date if Duration is Known</fullName>
        <actions>
            <name>FGM_Set_End_Date_if_Duration_is_Known</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.End_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Duration_Months__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
