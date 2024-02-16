const { Employee } = require('../models');

exports.getAllEmployees = async (req, res) => {
  try {
    const employees = await Employee.findAll();
    res.json(employees);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
};

exports.getEmployeeById = async (req, res) => {
  const { id } = req.params;
  try {
    const employee = await Employee.findByPk(id);
    if (!employee) {
      return res.status(404).json({ message: 'Employee not found' });
    }
    res.json(employee);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
};

exports.createEmployee = async (req, res) => {
  const { nama, jabatan } = req.body;
  try {
    const employee = await Employee.create({ nama, jabatan });
    res.status(201).json(employee);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
};

exports.updateEmployee = async (req, res) => {
    const { id } = req.params;
    const { nama, jabatan } = req.body;
    try {
      let employee = await Employee.findByPk(id);
      if (!employee) {
        return res.status(404).json({ message: 'Employee not found' });
      }
      employee.nama = nama;
      employee.jabatan = jabatan;
      await employee.save();
      res.json(employee);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal Server Error' });
    }
  };
  
  exports.deleteEmployee = async (req, res) => {
    const { id } = req.params;
    try {
      const employee = await Employee.findByPk(id);
      if (!employee) {
        return res.status(404).json({ message: 'Employee not found' });
      }
      await employee.destroy();
      res.json({ message: 'Employee deleted successfully' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal Server Error' });
    }
  };
  
