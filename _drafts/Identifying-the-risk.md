---
layout: post
title:  "Identifying the risk"
subtitle: "Assuring quality more efficiently"
categories: [engineering]
tags: [engineering, scalability, Java]
header-img: 'https://veritusgroup.com/wp-content/uploads/2018/05/chaotic-thoughts-2018May21-1.jpg'
---
Services partially down, a database draining your CPU resources when performing an important ETL script, a burst of requests
received in short period of time... There are many factors that might affect the performance and reliability of our
systems. We simply can't predict (and in some cases prevent) such an incident, but we can certainly mitigate their impact
when such a problem happen.

## The hidden problems
The majority of software teams work developing solutions to other industries (textile, car manufactures, real state,
financial institutions, e-commerces, small retailers, etc). Being it automating repetitive tasks or providing
cutting-edge insights through real time data analysis, there's an inherent expectation that developers must focus
on what brings more value to their customers: the business layer. With that, it's safe to assume that it would be
the most reliable part of the whole system. Whenever a new feature is requested by the product
team, our natural reaction as problem-solvers is to jump into the code and find a way to leverage that requirement. 

```kotlin
interface InvoiceComponent
{
    fun importInvoicesOnRemoteJsonFile(customerId: UUID, remoteJsonFileLocation: String)

    fun importInvoice(customer: Customer, invoice: Invoice)
}
```
To further understand Consider the above Kotlin code as an example. It is a simple routine that will try to import invoices from
a remote JSON file. Its contract is rather simple, It expects a string containing the Json location as parameter.


```kotlin
fun importInvoicesOnRemoteJsonFile(customerId: UUID, remoteJsonFileLocation: String) {
    val customer: Customer = customerRepository.findById(customerId) ?: throw BusinessException("Customer not found")
    val jsonUrl = URL(remoteJsonFileLocation)
    jsonUrl.openConnection().url { byteStream ->
        val batchResult: Invoices = json.readJson<Invoices>(byteStream)
        for (item in batchResult.items) {
            importInvoice(item)
        }
    }
}
```
We can also assume that, 


## Identifying the risk