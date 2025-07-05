# Page 1

26.3. Variables

<table>
  <thead>
    <tr>
      <th>Type</th>
      <th>Description</th>
      <th>Wrapper Class</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>`byte`</td>
      <td>8-bit signed 2s complement integer</td>
      <td>`Byte`</td>
    </tr>
    <tr>
      <td>`short`</td>
      <td>16-bit signed 2s complement integer</td>
      <td>`Short`</td>
    </tr>
    <tr>
      <td>`int`</td>
      <td>32-bit signed 2s complement integer</td>
      <td>`Integer`</td>
    </tr>
    <tr>
      <td>`long`</td>
      <td>64-bit signed 2s complement integer</td>
      <td>`Long`</td>
    </tr>
    <tr>
      <td>`float`</td>
      <td>32-bit IEEE 754 floating point number</td>
      <td>`Float`</td>
    </tr>
    <tr>
      <td>`double`</td>
      <td>64-bit floating point number</td>
      <td>`Double`</td>
    </tr>
    <tr>
      <td>`boolean`</td>
      <td>may be set to `true` or `false`</td>
      <td>`Boolean`</td>
    </tr>
    <tr>
      <td>`char`</td>
      <td>16-bit Unicode (UTF-16) character</td>
    </tr>
  </tbody>
</table>

Table 26.2.: Primitive types in Java

### 26.3.1. Declaration & Assignment

Java is a statically typed language meaning that all variables must be declared before you can use them or refer to them. In addition, when declaring a variable, you must specify both its type and its identifier. For example:

```
1 int numUnits;
2 double costPerUnit;
3 char firstInitial;
4 boolean isStudent;
```

Each declaration specifies the variable’s type followed by the identifier and ending with a semicolon. The identifier rules are fairly standard: a name can consist of lowercase and uppercase alphabetic characters, numbers, and underscores but may _not_ begin with a numeric character. We adopt the modern camelCasing naming convention for variables in our code. In general, variables _must_ be assigned a value before you can use them in (though it is good practice), but some value _must_ be assigned before they can be used or the compiler will issue an error. [^2]

The assignment operator is a single equal sign, `=`, and is a right-to-left assignment. That is, the variable that we wish to assign the value to appears on the left-hand-side while the value (literal, variable or expression) is on the right-hand-size. Using our variables from before, we can assign them values:

[^2] Instance variables, that is variables declared as part of an object _do_ have default values. For objects, the default is `null` , for all numeric types, zero is the default value. For the `boolean` type, `false` is the default, and the default `char` value is `\0`, the null-terminating character (zero in the ASCII table).

<page_number>391<page_number>

