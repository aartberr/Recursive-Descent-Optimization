# Recursive Descent Algorithms for Optimization

This project was created as part of a course assignment for the **Optimization techniques** class at **ECE, AUTH University**.

This project implements and compares various optimization techniques for minimizing a multivariable function. The function used for the optimization is:

**f(x, y) = x³ * e^(-x² - y²)** but it can be adjusted as needed.

The following optimization methods are applied:

1. **Steepest Descent Method** with different step size strategies:
   - **Fixed step** (gamma_k is constant)
   - **Adaptive step** based on the minimization of `f(x_k + γ_k d_k)`
   - **Armijo rule** to determine the optimal step size

2. **Newton's Method** using the above step strategies.
   
3. **Levenberg-Marquardt Method**   also utilizing the described step strategies.

### Files

- **assignment2.m**: Main script that plots the function **f(x, y)** and applies the optimization methods (Steepest Descent, Newton, Levenberg-Marquardt). It monitors the convergence and plots the iteration vs. convergence graph.
- **steepestdecentmethod.m**: Implements the Steepest Descent method for optimization.
- **newtonmethod.m**: Implements Newton’s Method for optimization.
- **levenbergmarquardtmethod.m**: Implements the Levenberg-Marquardt method for optimization.
- **bisectormethoddif2.m**: Used for calculating the minimal step **γ_k** for the adaptive step.
- 
### Functionality

1. The **assignment2.m** file provides the following:
   - It plots the function **f(x, y)**.
   - It applies the **Steepest Descent** method with three different strategies for the step size:
     - A fixed step size.
     - A step size that minimizes **f(x_k + γ_k d_k)**.
     - A step size determined by the **Armijo Rule**.
   - The **Newton's Method** and **Levenberg-Marquardt** method are also applied.
   - For each method, the script monitors the convergence and plots the number of iterations against convergence.

2. All methods are implemented as MATLAB functions with separate files for each method:
   - **steepestdecentmethod.m**
   - **newtonmethod.m**
   - **levenbergmarquardtmethod.m**
   - **bisectormethoddif2.m** (for calculating optimal step size)

### Usage

To run the project:
1. Open the `assignment2.m` script in MATLAB.
2. Modify the function or the starting points **x0, y0** if needed.
3. Execute the script to see the optimization results and convergence graphs.
