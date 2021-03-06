class DesksController < Lina::ApplicationController
  define_action :index, {
    name: '显示所有桌子',
    description: '显示所有桌子的描述',
    params: {
    },
    return: {
      type: 'array',
      items: {
        type: 'object',
        required: [ 'name' ],
        properties: {
          name: {
            type: 'string',
          }
        }
      }
    }
  } do
    @desks = [
      { name: 'name1' },
      { name: 'name2' },
    ]
  end

  define_action :show, {
    name: '显示指定的桌子',
    params: {
      type: 'object',
      required: ['id'],
      properties: {
        id: {
          type: 'string',
        },
        filter_name: {
          type: 'string',
          maxLength: 5,
          minLength: 1,
        }
      },
    },
    return: {
      type: 'object',
      required: [ 'name' ],
      properties: {
        name: {
          type: 'string'
        }
      }
    }
  } do
    render json: { name: 'desk name' }
  end

  define_action :update, {
    name: '更新指定的桌子',
    params: {
      type: 'object',
      required: [ 'id' ],
      properties: {
        id: {
          type: 'string',
        },
      }
    },
    return: {
      type: 'object',
      required: [ 'name' ],
      properties: {
        name: {
          type: 'string'
        }
      }
    }
  } do
    render json: { }
  end

  define_action :default_value, {
    name: '更新指定的桌子',
    params: {
      type: 'object',
      required: [ 'filter' ],
      properties: {
        filter: {
          type: 'string',
          default: 'default',
        }
      }
    },
    return: {
    }
  } do
    @filter = params[:filter]
    render json: { }
  end
end
