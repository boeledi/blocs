# Reactive Programming - BLoC - Practical Use Cases and Patterns

Source code of the article available on [didierboelens.com](https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/)

This article introduces some practical use cases of the BLoC pattern:

* Event-State

    Sometimes, handling a series of activities which might be sequential or parallel, long or short, synchronous or asynchronous and which could also lead to various results, can become extremely hard to program. You might also require to update the display along with the progress or depending on the states.

    This first use case is aimed at making it easier to handle such situation.

* Form Validation

    How to make it easier to automate a Form fields content validation and Widgets accessibility, based on Business Rules?

    This second use case shows how to achieve this, separating the business rules from the View.

    As a bonus, it also shows how to answer a question very frequently asked: "*how to check if a password and retyped password match?*".

* Part Of

    This last use case explains how easy it is, thanks to the BLoC pattern, to make an isolated Widget behavior adapt based on its presence in a set.

    The source code, through a embryo of a Shopping Basket application, shows how a Widget knows it is part of the Shopping Basket or not, and how it can adapt its behavior accordingly.

<hr/>

## Updated (20 DEC 2018)

* Code clean up

* Additional version of the "DecisionPage" (see decision_page_no_business.dart)
    This version of the page does not contain any Business Logic but externalizes the Business Logic via the [DecisionStateTransform] which extends the [BlocStateTransformBase]