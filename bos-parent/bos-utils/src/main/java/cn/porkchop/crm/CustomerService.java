package cn.porkchop.crm;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.10
 * 2018-03-20T17:14:01.314+08:00
 * Generated source version: 3.1.10
 * 
 */
@WebService(targetNamespace = "http://service.crm.porkchop.cn/", name = "CustomerService")
@XmlSeeAlso({})
public interface CustomerService {

    @WebMethod
    @RequestWrapper(localName = "findAll", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.FindAll")
    @ResponseWrapper(localName = "findAllResponse", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.FindAllResponse")
    @WebResult(name = "return", targetNamespace = "")
    java.util.List<Customer> findAll();

    @WebMethod
    @RequestWrapper(localName = "findUnassociated", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.FindUnassociated")
    @ResponseWrapper(localName = "findUnassociatedResponse", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.FindUnassociatedResponse")
    @WebResult(name = "return", targetNamespace = "")
    java.util.List<Customer> findUnassociated();

    @WebMethod
    @RequestWrapper(localName = "associateCustomerToDecidedZone", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.AssociateCustomerToDecidedZone")
    @ResponseWrapper(localName = "associateCustomerToDecidedZoneResponse", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.AssociateCustomerToDecidedZoneResponse")
    void associateCustomerToDecidedZone(
            @WebParam(name = "arg0", targetNamespace = "")
                    String arg0,
            @WebParam(name = "arg1", targetNamespace = "")
                    java.util.List<Integer> arg1
    );

    @WebMethod
    @RequestWrapper(localName = "findByDecidedZoneId", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.FindByDecidedZoneId")
    @ResponseWrapper(localName = "findByDecidedZoneIdResponse", targetNamespace = "http://service.crm.porkchop.cn/", className = "cn.porkchop.crm.FindByDecidedZoneIdResponse")
    @WebResult(name = "return", targetNamespace = "")
    java.util.List<Customer> findByDecidedZoneId(
            @WebParam(name = "arg0", targetNamespace = "")
                    String arg0
    );
}