// migrations/<timestamp>-create-employee-family-table.js

'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('employee_family', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },
      employee_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'employee',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      name: {
        type: Sequelize.STRING(225),
        allowNull: true
      },
      identifier: {
        type: Sequelize.STRING(225),
        allowNull: true
      },
      job: {
        type: Sequelize.STRING(225),
        allowNull: true
      },
      place_of_birth: {
        type: Sequelize.DATE,
        allowNull: true
      },
      date_of_birth: {
        type: Sequelize.DATE,
        allowNull: true
      },
      religion: {
        type: Sequelize.ENUM('islam', 'katolik', 'buddha', 'protestan', 'konghucu'),
        allowNull: true
      },
      is_life: {
        type: Sequelize.BOOLEAN,
        allowNull: true
      },
      is_divorced: {
        type: Sequelize.BOOLEAN,
        allowNull: true
      },
      relation_status: {
        type: Sequelize.STRING(225),
        allowNull: true
      },
      created_by: {
        type: Sequelize.STRING(225),
        allowNull: true
      },
      updated_by: {
        type: Sequelize.STRING(225),
        allowNull: true
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP')
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP')
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('employee_family');
  }
};
