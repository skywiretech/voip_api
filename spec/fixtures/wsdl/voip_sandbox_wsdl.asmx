<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://tempuri.org/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://tempuri.org/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://tempuri.org/">
      <s:element name="addLocation">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="city" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="plusFour" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="callerName" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="addLocationResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="addLocationResult" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="Response911">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="responseCode" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="responseMessage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Statuses" type="tns:ArrayOfStatus911" />
          <s:element minOccurs="0" maxOccurs="1" name="DID911s" type="tns:ArrayOfDID911" />
          <s:element minOccurs="0" maxOccurs="1" name="VILocations" type="tns:ArrayOfVILocation" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfStatus911">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Status911" nillable="true" type="tns:Status911" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Status911">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="code" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="description" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfDID911">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="DID911" nillable="true" type="tns:DID911" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="DID911">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="locationId" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="callerName" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="address1" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="address2" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="city" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="zipCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="latitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="longitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="statusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="statusDescription" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="activatedTime" nillable="true" type="s:dateTime" />
          <s:element minOccurs="0" maxOccurs="1" name="dateAdded" nillable="true" type="s:dateTime" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfVILocation">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="VILocation" nillable="true" type="tns:VILocation" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="VILocation">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="locationId" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="address1" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="address2" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="city" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="zipCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="plusFour" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="callerName" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="latitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="longitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="statusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="statusDescription" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="orderId" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="activatedTime" type="s:dateTime" />
          <s:element minOccurs="0" maxOccurs="1" name="updateTime" type="s:dateTime" />
        </s:sequence>
      </s:complexType>
      <s:element name="assignDID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="didParams" type="tns:ArrayOfDIDParam" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfDIDParam">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="DIDParam" nillable="true" type="tns:DIDParam" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="DIDParam">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="cnam" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="refId" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="epg" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:element name="assignDIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="assignDIDResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="DIDResponse">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="responseCode" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="responseMessage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DIDs" type="tns:ArrayOfDID" />
          <s:element minOccurs="0" maxOccurs="1" name="DIDLocators" type="tns:ArrayOfDIDLocator" />
          <s:element minOccurs="0" maxOccurs="1" name="DIDCounts" type="tns:ArrayOfDIDCount" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfDID">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="DID" nillable="true" type="tns:DID" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="DID">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="availability" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="rewrite" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="status" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="statusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="tier" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="refId" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="endpointId" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="expireDate" nillable="true" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="has411" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="has911" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="cnam" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="cnamStorageActive" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="cnamStorageAvailability" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="t38" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfDIDLocator">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="DIDLocator" nillable="true" type="tns:DIDLocator" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="DIDLocator">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="rateCenter" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="tier" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="lataId" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="outboundCNAM" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="t38" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfDIDCount">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="DIDCount" nillable="true" type="tns:DIDCount" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="DIDCount">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="didCount" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="rateCenter" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="tier" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="lataId" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="cnam" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="t38" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:element name="audit911">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="audit911Response">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="audit911Result" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="auditDIDs">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="auditDIDsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="auditDIDsResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="configDID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="didParams" type="tns:ArrayOfDIDParam" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="configDIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="configDIDResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getDIDCount">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="lata" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="rateCenter" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="npa" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="nxx" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tier" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="t38" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="cnam" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="orderby" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getDIDCountResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getDIDCountResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getDIDs">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="lata" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="rateCenter" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="npa" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="nxx" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tier" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="t38" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="cnam" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getDIDsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getDIDsResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getLocations">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getLocationsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getLocationsResult" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getPortDetails">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="1" maxOccurs="1" name="portId" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getPortDetailsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getPortDetailsResult" type="tns:PortResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="PortResponse">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="responseCode" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="responseMessage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PortDetails" type="tns:PortDetail" />
          <s:element minOccurs="1" maxOccurs="1" name="IsPortable" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="PortDetail">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="id" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="status" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="endUser" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="billingTN" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="portingFrom" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="salesRep" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="submittedDate" nillable="true" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="focDate" nillable="true" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="requestedFocDate" nillable="true" type="s:dateTime" />
          <s:element minOccurs="0" maxOccurs="1" name="dids" type="tns:ArrayOfPortDID" />
          <s:element minOccurs="1" maxOccurs="1" name="defaultEndpointGroup" nillable="true" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfPortDID">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="PortDID" nillable="true" type="tns:PortDID" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="PortDID">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="tier" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="rateCenter" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="lata" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="endpointGroup" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="cnam" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="e911" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:element name="getProvisioningHistory">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getProvisioningHistoryResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getProvisioningHistoryResult" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="insert911">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="city" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="plusFour" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="callerName" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="insert911Response">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="insert911Result" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="provisionLocation">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="locationId" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="provisionLocationResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="provisionLocationResult" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="query911">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="query911Response">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="query911Result" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="queryDID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="queryDIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="queryDIDResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="releaseDID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="didParams" type="tns:ArrayOfDIDParam" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="releaseDIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="releaseDIDResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="remove911">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="remove911Response">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="remove911Result" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="removeLocation">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="locationId" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="removeLocationResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="removeLocationResult" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="reserveDID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="didParams" type="tns:ArrayOfDIDParam" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="reserveDIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="reserveDIDResult" type="tns:DIDResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="update911">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="did" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="city" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="plusFour" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="callerName" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="update911Response">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="update911Result" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="validate911">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="address2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="city" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="state" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="plusFour" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="callerName" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="validate911Response">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="validate911Result" type="tns:Response911" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="isPortable">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="isPortableResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="isPortableResult" type="tns:PortResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetCountries">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetCountriesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetCountriesResult" type="tns:IntlResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="IntlResponse">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="responseCode" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="responseMessage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Countries" type="tns:ArrayOfCountry" />
          <s:element minOccurs="0" maxOccurs="1" name="DID" type="tns:IntlDID" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfCountry">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Country" nillable="true" type="tns:Country" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Country">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="name" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="abbrev" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="cities" type="tns:ArrayOfCity" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfCity">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="City" nillable="true" type="tns:City" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="City">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="name" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="id" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="IntlDID">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="country" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="city" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="AssignIntlDID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="1" maxOccurs="1" name="cityID" type="s:int" />
            <s:element minOccurs="1" maxOccurs="1" name="epgID" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AssignIntlDIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AssignIntlDIDResult" type="tns:IntlResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReleaseIntlDID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReleaseIntlDIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ReleaseIntlDIDResult" type="tns:IntlResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetCNAMDisplay">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetCNAMDisplayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetCNAMDisplayResult" type="tns:CNAMResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="CNAMResponse">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="responseCode" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="responseMessage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DisplayName" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="UpdateCNAMDisplay">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="name" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateCNAMDisplayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="UpdateCNAMDisplayResult" type="tns:CNAMResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="RemoveCNAM">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="RemoveCNAMResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="RemoveCNAMResult" type="tns:CNAMResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="SetFaxToEmail">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="email" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="SetFaxToEmailResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="SetFaxToEmailResult" type="tns:FaxToEmailResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="FaxToEmailResponse">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="responseCode" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="responseMessage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Email" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetFaxToEmail">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetFaxToEmailResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetFaxToEmailResult" type="tns:FaxToEmailResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="RemoveFaxToEmail">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="login" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="secret" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="tn" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="RemoveFaxToEmailResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="RemoveFaxToEmailResult" type="tns:FaxToEmailResponse" />
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="addLocationSoapIn">
    <wsdl:part name="parameters" element="tns:addLocation" />
  </wsdl:message>
  <wsdl:message name="addLocationSoapOut">
    <wsdl:part name="parameters" element="tns:addLocationResponse" />
  </wsdl:message>
  <wsdl:message name="assignDIDSoapIn">
    <wsdl:part name="parameters" element="tns:assignDID" />
  </wsdl:message>
  <wsdl:message name="assignDIDSoapOut">
    <wsdl:part name="parameters" element="tns:assignDIDResponse" />
  </wsdl:message>
  <wsdl:message name="audit911SoapIn">
    <wsdl:part name="parameters" element="tns:audit911" />
  </wsdl:message>
  <wsdl:message name="audit911SoapOut">
    <wsdl:part name="parameters" element="tns:audit911Response" />
  </wsdl:message>
  <wsdl:message name="auditDIDsSoapIn">
    <wsdl:part name="parameters" element="tns:auditDIDs" />
  </wsdl:message>
  <wsdl:message name="auditDIDsSoapOut">
    <wsdl:part name="parameters" element="tns:auditDIDsResponse" />
  </wsdl:message>
  <wsdl:message name="configDIDSoapIn">
    <wsdl:part name="parameters" element="tns:configDID" />
  </wsdl:message>
  <wsdl:message name="configDIDSoapOut">
    <wsdl:part name="parameters" element="tns:configDIDResponse" />
  </wsdl:message>
  <wsdl:message name="getDIDCountSoapIn">
    <wsdl:part name="parameters" element="tns:getDIDCount" />
  </wsdl:message>
  <wsdl:message name="getDIDCountSoapOut">
    <wsdl:part name="parameters" element="tns:getDIDCountResponse" />
  </wsdl:message>
  <wsdl:message name="getDIDsSoapIn">
    <wsdl:part name="parameters" element="tns:getDIDs" />
  </wsdl:message>
  <wsdl:message name="getDIDsSoapOut">
    <wsdl:part name="parameters" element="tns:getDIDsResponse" />
  </wsdl:message>
  <wsdl:message name="getLocationsSoapIn">
    <wsdl:part name="parameters" element="tns:getLocations" />
  </wsdl:message>
  <wsdl:message name="getLocationsSoapOut">
    <wsdl:part name="parameters" element="tns:getLocationsResponse" />
  </wsdl:message>
  <wsdl:message name="getPortDetailsSoapIn">
    <wsdl:part name="parameters" element="tns:getPortDetails" />
  </wsdl:message>
  <wsdl:message name="getPortDetailsSoapOut">
    <wsdl:part name="parameters" element="tns:getPortDetailsResponse" />
  </wsdl:message>
  <wsdl:message name="getProvisioningHistorySoapIn">
    <wsdl:part name="parameters" element="tns:getProvisioningHistory" />
  </wsdl:message>
  <wsdl:message name="getProvisioningHistorySoapOut">
    <wsdl:part name="parameters" element="tns:getProvisioningHistoryResponse" />
  </wsdl:message>
  <wsdl:message name="insert911SoapIn">
    <wsdl:part name="parameters" element="tns:insert911" />
  </wsdl:message>
  <wsdl:message name="insert911SoapOut">
    <wsdl:part name="parameters" element="tns:insert911Response" />
  </wsdl:message>
  <wsdl:message name="provisionLocationSoapIn">
    <wsdl:part name="parameters" element="tns:provisionLocation" />
  </wsdl:message>
  <wsdl:message name="provisionLocationSoapOut">
    <wsdl:part name="parameters" element="tns:provisionLocationResponse" />
  </wsdl:message>
  <wsdl:message name="query911SoapIn">
    <wsdl:part name="parameters" element="tns:query911" />
  </wsdl:message>
  <wsdl:message name="query911SoapOut">
    <wsdl:part name="parameters" element="tns:query911Response" />
  </wsdl:message>
  <wsdl:message name="queryDIDSoapIn">
    <wsdl:part name="parameters" element="tns:queryDID" />
  </wsdl:message>
  <wsdl:message name="queryDIDSoapOut">
    <wsdl:part name="parameters" element="tns:queryDIDResponse" />
  </wsdl:message>
  <wsdl:message name="releaseDIDSoapIn">
    <wsdl:part name="parameters" element="tns:releaseDID" />
  </wsdl:message>
  <wsdl:message name="releaseDIDSoapOut">
    <wsdl:part name="parameters" element="tns:releaseDIDResponse" />
  </wsdl:message>
  <wsdl:message name="remove911SoapIn">
    <wsdl:part name="parameters" element="tns:remove911" />
  </wsdl:message>
  <wsdl:message name="remove911SoapOut">
    <wsdl:part name="parameters" element="tns:remove911Response" />
  </wsdl:message>
  <wsdl:message name="removeLocationSoapIn">
    <wsdl:part name="parameters" element="tns:removeLocation" />
  </wsdl:message>
  <wsdl:message name="removeLocationSoapOut">
    <wsdl:part name="parameters" element="tns:removeLocationResponse" />
  </wsdl:message>
  <wsdl:message name="reserveDIDSoapIn">
    <wsdl:part name="parameters" element="tns:reserveDID" />
  </wsdl:message>
  <wsdl:message name="reserveDIDSoapOut">
    <wsdl:part name="parameters" element="tns:reserveDIDResponse" />
  </wsdl:message>
  <wsdl:message name="update911SoapIn">
    <wsdl:part name="parameters" element="tns:update911" />
  </wsdl:message>
  <wsdl:message name="update911SoapOut">
    <wsdl:part name="parameters" element="tns:update911Response" />
  </wsdl:message>
  <wsdl:message name="validate911SoapIn">
    <wsdl:part name="parameters" element="tns:validate911" />
  </wsdl:message>
  <wsdl:message name="validate911SoapOut">
    <wsdl:part name="parameters" element="tns:validate911Response" />
  </wsdl:message>
  <wsdl:message name="isPortableSoapIn">
    <wsdl:part name="parameters" element="tns:isPortable" />
  </wsdl:message>
  <wsdl:message name="isPortableSoapOut">
    <wsdl:part name="parameters" element="tns:isPortableResponse" />
  </wsdl:message>
  <wsdl:message name="GetCountriesSoapIn">
    <wsdl:part name="parameters" element="tns:GetCountries" />
  </wsdl:message>
  <wsdl:message name="GetCountriesSoapOut">
    <wsdl:part name="parameters" element="tns:GetCountriesResponse" />
  </wsdl:message>
  <wsdl:message name="AssignIntlDIDSoapIn">
    <wsdl:part name="parameters" element="tns:AssignIntlDID" />
  </wsdl:message>
  <wsdl:message name="AssignIntlDIDSoapOut">
    <wsdl:part name="parameters" element="tns:AssignIntlDIDResponse" />
  </wsdl:message>
  <wsdl:message name="ReleaseIntlDIDSoapIn">
    <wsdl:part name="parameters" element="tns:ReleaseIntlDID" />
  </wsdl:message>
  <wsdl:message name="ReleaseIntlDIDSoapOut">
    <wsdl:part name="parameters" element="tns:ReleaseIntlDIDResponse" />
  </wsdl:message>
  <wsdl:message name="GetCNAMDisplaySoapIn">
    <wsdl:part name="parameters" element="tns:GetCNAMDisplay" />
  </wsdl:message>
  <wsdl:message name="GetCNAMDisplaySoapOut">
    <wsdl:part name="parameters" element="tns:GetCNAMDisplayResponse" />
  </wsdl:message>
  <wsdl:message name="UpdateCNAMDisplaySoapIn">
    <wsdl:part name="parameters" element="tns:UpdateCNAMDisplay" />
  </wsdl:message>
  <wsdl:message name="UpdateCNAMDisplaySoapOut">
    <wsdl:part name="parameters" element="tns:UpdateCNAMDisplayResponse" />
  </wsdl:message>
  <wsdl:message name="RemoveCNAMSoapIn">
    <wsdl:part name="parameters" element="tns:RemoveCNAM" />
  </wsdl:message>
  <wsdl:message name="RemoveCNAMSoapOut">
    <wsdl:part name="parameters" element="tns:RemoveCNAMResponse" />
  </wsdl:message>
  <wsdl:message name="SetFaxToEmailSoapIn">
    <wsdl:part name="parameters" element="tns:SetFaxToEmail" />
  </wsdl:message>
  <wsdl:message name="SetFaxToEmailSoapOut">
    <wsdl:part name="parameters" element="tns:SetFaxToEmailResponse" />
  </wsdl:message>
  <wsdl:message name="GetFaxToEmailSoapIn">
    <wsdl:part name="parameters" element="tns:GetFaxToEmail" />
  </wsdl:message>
  <wsdl:message name="GetFaxToEmailSoapOut">
    <wsdl:part name="parameters" element="tns:GetFaxToEmailResponse" />
  </wsdl:message>
  <wsdl:message name="RemoveFaxToEmailSoapIn">
    <wsdl:part name="parameters" element="tns:RemoveFaxToEmail" />
  </wsdl:message>
  <wsdl:message name="RemoveFaxToEmailSoapOut">
    <wsdl:part name="parameters" element="tns:RemoveFaxToEmailResponse" />
  </wsdl:message>
  <wsdl:portType name="APIServiceSoap">
    <wsdl:operation name="addLocation">
      <wsdl:input message="tns:addLocationSoapIn" />
      <wsdl:output message="tns:addLocationSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="assignDID">
      <wsdl:input message="tns:assignDIDSoapIn" />
      <wsdl:output message="tns:assignDIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="audit911">
      <wsdl:input message="tns:audit911SoapIn" />
      <wsdl:output message="tns:audit911SoapOut" />
    </wsdl:operation>
    <wsdl:operation name="auditDIDs">
      <wsdl:input message="tns:auditDIDsSoapIn" />
      <wsdl:output message="tns:auditDIDsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="configDID">
      <wsdl:input message="tns:configDIDSoapIn" />
      <wsdl:output message="tns:configDIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getDIDCount">
      <wsdl:input message="tns:getDIDCountSoapIn" />
      <wsdl:output message="tns:getDIDCountSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getDIDs">
      <wsdl:input message="tns:getDIDsSoapIn" />
      <wsdl:output message="tns:getDIDsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getLocations">
      <wsdl:input message="tns:getLocationsSoapIn" />
      <wsdl:output message="tns:getLocationsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getPortDetails">
      <wsdl:input message="tns:getPortDetailsSoapIn" />
      <wsdl:output message="tns:getPortDetailsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getProvisioningHistory">
      <wsdl:input message="tns:getProvisioningHistorySoapIn" />
      <wsdl:output message="tns:getProvisioningHistorySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="insert911">
      <wsdl:input message="tns:insert911SoapIn" />
      <wsdl:output message="tns:insert911SoapOut" />
    </wsdl:operation>
    <wsdl:operation name="provisionLocation">
      <wsdl:input message="tns:provisionLocationSoapIn" />
      <wsdl:output message="tns:provisionLocationSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="query911">
      <wsdl:input message="tns:query911SoapIn" />
      <wsdl:output message="tns:query911SoapOut" />
    </wsdl:operation>
    <wsdl:operation name="queryDID">
      <wsdl:input message="tns:queryDIDSoapIn" />
      <wsdl:output message="tns:queryDIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="releaseDID">
      <wsdl:input message="tns:releaseDIDSoapIn" />
      <wsdl:output message="tns:releaseDIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="remove911">
      <wsdl:input message="tns:remove911SoapIn" />
      <wsdl:output message="tns:remove911SoapOut" />
    </wsdl:operation>
    <wsdl:operation name="removeLocation">
      <wsdl:input message="tns:removeLocationSoapIn" />
      <wsdl:output message="tns:removeLocationSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="reserveDID">
      <wsdl:input message="tns:reserveDIDSoapIn" />
      <wsdl:output message="tns:reserveDIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="update911">
      <wsdl:input message="tns:update911SoapIn" />
      <wsdl:output message="tns:update911SoapOut" />
    </wsdl:operation>
    <wsdl:operation name="validate911">
      <wsdl:input message="tns:validate911SoapIn" />
      <wsdl:output message="tns:validate911SoapOut" />
    </wsdl:operation>
    <wsdl:operation name="isPortable">
      <wsdl:input message="tns:isPortableSoapIn" />
      <wsdl:output message="tns:isPortableSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCountries">
      <wsdl:input message="tns:GetCountriesSoapIn" />
      <wsdl:output message="tns:GetCountriesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AssignIntlDID">
      <wsdl:input message="tns:AssignIntlDIDSoapIn" />
      <wsdl:output message="tns:AssignIntlDIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ReleaseIntlDID">
      <wsdl:input message="tns:ReleaseIntlDIDSoapIn" />
      <wsdl:output message="tns:ReleaseIntlDIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCNAMDisplay">
      <wsdl:input message="tns:GetCNAMDisplaySoapIn" />
      <wsdl:output message="tns:GetCNAMDisplaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="UpdateCNAMDisplay">
      <wsdl:input message="tns:UpdateCNAMDisplaySoapIn" />
      <wsdl:output message="tns:UpdateCNAMDisplaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="RemoveCNAM">
      <wsdl:input message="tns:RemoveCNAMSoapIn" />
      <wsdl:output message="tns:RemoveCNAMSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="SetFaxToEmail">
      <wsdl:input message="tns:SetFaxToEmailSoapIn" />
      <wsdl:output message="tns:SetFaxToEmailSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetFaxToEmail">
      <wsdl:input message="tns:GetFaxToEmailSoapIn" />
      <wsdl:output message="tns:GetFaxToEmailSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="RemoveFaxToEmail">
      <wsdl:input message="tns:RemoveFaxToEmailSoapIn" />
      <wsdl:output message="tns:RemoveFaxToEmailSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="APIServiceSoap" type="tns:APIServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="addLocation">
      <soap:operation soapAction="http://tempuri.org/addLocation" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="assignDID">
      <soap:operation soapAction="http://tempuri.org/assignDID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="audit911">
      <soap:operation soapAction="http://tempuri.org/audit911" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="auditDIDs">
      <soap:operation soapAction="http://tempuri.org/auditDIDs" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="configDID">
      <soap:operation soapAction="http://tempuri.org/configDID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getDIDCount">
      <soap:operation soapAction="http://tempuri.org/getDIDCount" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getDIDs">
      <soap:operation soapAction="http://tempuri.org/getDIDs" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getLocations">
      <soap:operation soapAction="http://tempuri.org/getLocations" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getPortDetails">
      <soap:operation soapAction="http://tempuri.org/getPortDetails" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getProvisioningHistory">
      <soap:operation soapAction="http://tempuri.org/getProvisioningHistory" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="insert911">
      <soap:operation soapAction="http://tempuri.org/insert911" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="provisionLocation">
      <soap:operation soapAction="http://tempuri.org/provisionLocation" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="query911">
      <soap:operation soapAction="http://tempuri.org/query911" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="queryDID">
      <soap:operation soapAction="http://tempuri.org/queryDID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="releaseDID">
      <soap:operation soapAction="http://tempuri.org/releaseDID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="remove911">
      <soap:operation soapAction="http://tempuri.org/remove911" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="removeLocation">
      <soap:operation soapAction="http://tempuri.org/removeLocation" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="reserveDID">
      <soap:operation soapAction="http://tempuri.org/reserveDID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="update911">
      <soap:operation soapAction="http://tempuri.org/update911" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="validate911">
      <soap:operation soapAction="http://tempuri.org/validate911" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="isPortable">
      <soap:operation soapAction="http://tempuri.org/isPortable" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCountries">
      <soap:operation soapAction="http://tempuri.org/GetCountries" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AssignIntlDID">
      <soap:operation soapAction="http://tempuri.org/AssignIntlDID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReleaseIntlDID">
      <soap:operation soapAction="http://tempuri.org/ReleaseIntlDID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCNAMDisplay">
      <soap:operation soapAction="http://tempuri.org/GetCNAMDisplay" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateCNAMDisplay">
      <soap:operation soapAction="http://tempuri.org/UpdateCNAMDisplay" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="RemoveCNAM">
      <soap:operation soapAction="http://tempuri.org/RemoveCNAM" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="SetFaxToEmail">
      <soap:operation soapAction="http://tempuri.org/SetFaxToEmail" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetFaxToEmail">
      <soap:operation soapAction="http://tempuri.org/GetFaxToEmail" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="RemoveFaxToEmail">
      <soap:operation soapAction="http://tempuri.org/RemoveFaxToEmail" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="APIServiceSoap12" type="tns:APIServiceSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="addLocation">
      <soap12:operation soapAction="http://tempuri.org/addLocation" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="assignDID">
      <soap12:operation soapAction="http://tempuri.org/assignDID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="audit911">
      <soap12:operation soapAction="http://tempuri.org/audit911" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="auditDIDs">
      <soap12:operation soapAction="http://tempuri.org/auditDIDs" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="configDID">
      <soap12:operation soapAction="http://tempuri.org/configDID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getDIDCount">
      <soap12:operation soapAction="http://tempuri.org/getDIDCount" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getDIDs">
      <soap12:operation soapAction="http://tempuri.org/getDIDs" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getLocations">
      <soap12:operation soapAction="http://tempuri.org/getLocations" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getPortDetails">
      <soap12:operation soapAction="http://tempuri.org/getPortDetails" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getProvisioningHistory">
      <soap12:operation soapAction="http://tempuri.org/getProvisioningHistory" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="insert911">
      <soap12:operation soapAction="http://tempuri.org/insert911" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="provisionLocation">
      <soap12:operation soapAction="http://tempuri.org/provisionLocation" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="query911">
      <soap12:operation soapAction="http://tempuri.org/query911" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="queryDID">
      <soap12:operation soapAction="http://tempuri.org/queryDID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="releaseDID">
      <soap12:operation soapAction="http://tempuri.org/releaseDID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="remove911">
      <soap12:operation soapAction="http://tempuri.org/remove911" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="removeLocation">
      <soap12:operation soapAction="http://tempuri.org/removeLocation" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="reserveDID">
      <soap12:operation soapAction="http://tempuri.org/reserveDID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="update911">
      <soap12:operation soapAction="http://tempuri.org/update911" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="validate911">
      <soap12:operation soapAction="http://tempuri.org/validate911" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="isPortable">
      <soap12:operation soapAction="http://tempuri.org/isPortable" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCountries">
      <soap12:operation soapAction="http://tempuri.org/GetCountries" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AssignIntlDID">
      <soap12:operation soapAction="http://tempuri.org/AssignIntlDID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReleaseIntlDID">
      <soap12:operation soapAction="http://tempuri.org/ReleaseIntlDID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCNAMDisplay">
      <soap12:operation soapAction="http://tempuri.org/GetCNAMDisplay" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateCNAMDisplay">
      <soap12:operation soapAction="http://tempuri.org/UpdateCNAMDisplay" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="RemoveCNAM">
      <soap12:operation soapAction="http://tempuri.org/RemoveCNAM" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="SetFaxToEmail">
      <soap12:operation soapAction="http://tempuri.org/SetFaxToEmail" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetFaxToEmail">
      <soap12:operation soapAction="http://tempuri.org/GetFaxToEmail" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="RemoveFaxToEmail">
      <soap12:operation soapAction="http://tempuri.org/RemoveFaxToEmail" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="APIService">
    <wsdl:port name="APIServiceSoap" binding="tns:APIServiceSoap">
      <soap:address location="http://dev.voipinnovations.com/VOIP/Services/APIService.asmx" />
    </wsdl:port>
    <wsdl:port name="APIServiceSoap12" binding="tns:APIServiceSoap12">
      <soap12:address location="http://dev.voipinnovations.com/VOIP/Services/APIService.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>