$doxydocs=
{
  classes => [
  ],
  concepts => [
  ],
  modules => [
  ],
  namespaces => [
  ],
  files => [
    {
      name => 'main.cpp',
      includes => [
        {
          name => 'iostream'
        },
        {
          name => 'cmath'
        },
        {
          name => 'GL/glut.h'
        },
        {
          name => 'fstream'
        },
        {
          name => 'chrono'
        },
        {
          name => 'thread'
        },
        {
          name => 'string'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'readSpeedFromFile',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Read the Speed data from file. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'This function captures the speed data from 1 (Min) to 10 (Max) speed at which the turbine blades are to be rotated '
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'std::vector<float> Array containing speed data '
                    }
                  ]
                }
              ]
            },
            type => 'std::vector< float >',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'update',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Update function for blade rotation. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'This function updates the rotation angle of turbine blades based on the speed from the file. Speed is modified almost every 5 seconds.'
                },
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'value'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'Timer value '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'value',
                type => 'int'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawFilledCircle',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Function to draw a filled circle. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'This function draws a filled circle using GL_TRIANGLE_FAN.'
                },
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'cx'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'X-coordinate of the center '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'cy'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Y-coordinate of the center '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'r'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Radius of the circle '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'num_segments'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Number of segments for circle approximation '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'cx',
                type => 'float'
              },
              {
                declaration_name => 'cy',
                type => 'float'
              },
              {
                declaration_name => 'r',
                type => 'float'
              },
              {
                declaration_name => 'num_segments',
                type => 'int'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawTurbineStructure',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Function to develop the structure of the turbine. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'This function creates the required structure to represent the WindTurbine This includes a Pole as its base A ciruclar structure and blades rotating about the center of that circle. '
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'display',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Display callback function. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'This function is performs the rendering of the wind turbine. '
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'keyboard',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Keyboard callback function. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'This function handles keyboard input.'
                },
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'key'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'ASCII code of the pressed key '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'x'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'X-coordinate of the mouse when key was pressed '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Y-coordinate of the mouse when key was pressed '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'key',
                type => 'unsigned char'
              },
              {
                declaration_name => 'x',
                type => 'int'
              },
              {
                declaration_name => 'y',
                type => 'int'
              }
            ]
          },
          {
            kind => 'function',
            name => 'main',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Main function. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Entry point of the program.'
                },
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'argc'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'Number of command-line arguments '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'argv'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Command-line argument values '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'int Exit status '
                    }
                  ]
                }
              ]
            },
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'argc',
                type => 'int'
              },
              {
                declaration_name => 'argv',
                type => 'char **'
              }
            ]
          }
        ]
      },
      variables => {
        members => [
          {
            kind => 'variable',
            name => 'bladeRotationAngle',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Initial rotation angle. '
                }
              ]
            },
            detailed => {},
            type => 'float',
            initializer => '= 0.0f'
          },
          {
            kind => 'variable',
            name => 'currentIndex',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Index to get the speed from the file. '
                }
              ]
            },
            detailed => {},
            type => 'int',
            initializer => '= 0'
          },
          {
            kind => 'variable',
            name => 'SpeedData',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Array to store the speed data from the file. '
                }
              ]
            },
            detailed => {},
            type => 'std::vector< float >',
            initializer => '= readSpeedFromFile()'
          },
          {
            kind => 'variable',
            name => 'i',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Index to denote Speed update. '
                }
              ]
            },
            detailed => {},
            type => 'int',
            initializer => '= 1'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Wind Turbine Simulation. '
          }
        ]
      },
      detailed => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            author => [
              {
                type => 'text',
                content => 'Sreenath Swaminathan '
              }
            ]
          },
          {
            date => [
              {
                type => 'text',
                content => '03.02.2023 '
              }
            ]
          }
        ]
      }
    }
  ],
  groups => [
  ],
  pages => [
  ]
};
1;
