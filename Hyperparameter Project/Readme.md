# hyperparameter Database Project

Hyperparameters are parameters that are specified prior to running machine learning algorithms
that have a large effect on the predictive power of statistical models. Knowledge of the relative
importance of a hyperparameter to an algorithm and its range of values is crucial to
hyperparameter tuning and creating effective models.
The hyperparameter database is a public resource with algorithms, tools, and data that allows users
to visualize and understand how to choose hyperparameters that maximize the predictive power of
their models.

The hyperparameter database is created by running millions of hyperparameter values, over
thousands of public datasets and calculating the individual conditional expectation of every
hyperparameter on the quality of a model.
Currently, the hyperparameter database analyzes the effect of hyperparameters on the following
algorithms: Distributed Random Forest (DRF), Generalized Linear Model (GLM), Gradient Boosting
Machine (GBM). Naïve Bayes Classifier, Stacked Ensembles, Xgboost and Deep Learning Models
(Neural Networks).

The hyperparameter database also uses these data to build models that can predict
hyperparameters without search and for visualizing and teaching statistical concepts such as power
and bias/variance tradeoff


