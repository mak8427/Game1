# Economic Simulation Game in LOVE2D

This project is an economic simulation game built using the LOVE2D game engine. The game models an agricultural economy where players manage a farm industry, track population changes, and monitor the economy's balance through various metrics.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Game Mechanics](#game-mechanics)
- [Functions and Classes](#functions-and-classes)
- [Contributing](#contributing)


## Installation

### Prerequisites

Ensure you have LOVE2D installed on your system. You can download it from [LOVE2D's official website](https://love2d.org/).

### Cloning the Repository

```sh
git clone https://github.com/your-username/economic-simulation-game.git
cd economic-simulation-game
```

## Usage

To run the game, navigate to the project directory and execute the following command:

```sh
love .
```

## Game Mechanics

### Population

- **Population Growth**: Population increases if the food supply is sufficient and decreases if the food supply is insufficient.
- **Food Consumption**: Each individual consumes a specific amount of food. The cost of food depends on its market value.

### Farm Industry

- **Production**: The farm industry produces food (ananas) based on the number of workers and the efficiency of production.
- **Income and Expenses**: The industry generates income from selling produced food and incurs expenses in the form of salaries for the workers.
- **Investment and Efficiency**: Profits are reinvested to increase production efficiency.

### Food

- **Value Fluctuation**: The value of food changes based on the balance between produced and sold quantities.
- **Stock Management**: The stock of food is updated each cycle based on production and sales.

## Functions and Classes

### Main Functions

- `love.load()`: Initializes the game, sets up initial variables, and creates population and industry objects.
- `love.update(dt)`: Updates the game state each cycle, including population changes, industry output, and food value adjustments.
- `love.draw()`: Renders the game statistics on the screen.

### Classes

#### `Pop`

- **Attributes**:
  - `food`
  - `number`
  - `money`
  - `salary`
  - `food_supply`
  - `work_industry`

- **Methods**:
  - `new()`
  - `Update()`
  - `Salary()`
  - `Food()`
  - `Change()`

#### `farm_industry`

- **Attributes**:
  - `pops`
  - `out`
  - `size`
  - `food_type`
  - `capital`
  - `dividends_rate`
  - `pop_salary`
  - `efficency`

- **Methods**:
  - `Update()`
  - `Output()`
  - `Income()`
  - `Expences()`
  - `Balance()`
  - `Capital()`
  - `Investment()`

#### `ananas`

- **Attributes**:
  - `output`
  - `value`
  - `produced`
  - `sold`
  - `stock`

- **Methods**:
  - `Update()`
  - `value_change()`

## Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request. Ensure your code adheres to the existing style and include comments where necessary.

### Steps to Contribute

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

