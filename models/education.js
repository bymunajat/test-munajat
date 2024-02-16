// migrations/<timestamp>-create-education-table.js

'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('education', {
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
        allowNull: false
      },
      level: {
        type: Sequelize.ENUM('TK', 'SD', 'SMP', 'SMA', 'S1'),
        allowNull: false
      },
      description: {
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
    await queryInterface.dropTable('education');
  }
};
