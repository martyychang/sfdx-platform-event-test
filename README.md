# SFDX App

_tl;dr_ The result of an async job enqueued by a platform event trigger
cannot be validated in an Apex test

This app demonstrates a limitation of Apex testing for Platform Events,
where `Test.stopTest()` does not resolve the async job enqueued
by a platform event trigger.

* `HelloEventTriggerTest.publishDefaultHello` passes, confirming
  expected behavior for a synchronous DML operation performed
  by a platform event trigger
* `AsyncHelloEventTriggerTest.publishDefaultHello` fails, exposing
  the bug or limitation in Apex tests where `Test.stopTest()` fails to resolve
  the enqueued `Queueable` job that is supposed to perform a DML operation

## Dev, Build and Test


## Resources


## Description of Files and Directories


## Issues


