
<?php
return [
	'permission' => [
		'list' 		=> 'permission.list',
		'create' 	=> 'permission.create',
		'edit' 		=> 'permission.edit',
		'destroy' 	=> 'permission.destroy',
	],
	'role' => [
		'list' 		=> 'role.list',
		'create' 	=> 'role.create',
		'edit' 		=> 'role.edit',
		'destroy' 	=> 'role.destroy',
		'show' 		=> 'role.show',
	],
	'user' => [
		'list' 		=> 'user.list',
		'create' 	=> 'user.create',
		'edit' 		=> 'user.edit',
		'destroy' 	=> 'user.destroy',
		'show' 		=> 'user.show',
		'reset' 	=> 'user.reset',
	],
	'menu' => [
		'list' 		=> 'menu.list',
		'create' 	=> 'menu.create',
		'edit' 		=> 'menu.edit',
		'orderable' => 'menu.edit',
		'destroy' 	=> 'menu.destroy',
		'show' 		=> 'menu.show',
	],
	'log' => [
		'list' 		=> 'log.list',
		'destroy' 	=> 'log.destroy',
		'show' 		=> 'log.show',
		'download' 	=> 'log.download',
		'filter' 	=> 'log.filter',
	],
	'system' => [
		'list' => 'system.index'
	],
    'trade' => [
        'list' 		=> 'trade.list',
        'create' 	=> 'trade.create',
        'edit' 		=> 'trade.edit',
        'deleted' 	=> 'trade.destroy'
    ],
    'tradeattr' => [
        'list' 		=> 'tradeattr.list',
        'create' 	=> 'tradeattr.create',
        'edit' 		=> 'tradeattr.edit',
        'deleted' 	=> 'tradeattr.destroy',
        'show' 	    => 'tradeattr.show',
    ],
    'brand' => [
        'list' 		=> 'brand.list',
        'create' 	=> 'brand.create',
        'edit' 		=> 'brand.edit',
        'deleted' 	=> 'brand.destroy',
    ],
    'unit' => [
        'list' 		=> 'unit.list',
        'create' 	=> 'unit.create',
        'edit' 		=> 'unit.edit',
        'deleted' 	=> 'unit.destroy'
    ],
    'business' => [
        'list'=>'business.list',
        'create'=>'business.create',
        'freeze'=>'business.freeze',
        'edit'=>'business.edit',
        'show'=>'business.show',
    ],
    'retail_business' => [
        'list'=>'retail_business.list',
        'create'=>'retail_business.create',
        'edit'=>'retail_business.edit',
        'freeze'=>'retail_business.freeze',
        'show'=>'retail_business.show',
    ],
    'goods' => [
        'list' 		=> 'goods.list',
        'create' 	=> 'goods.create',
        'edit' 		=> 'goods.edit',
        'deleted' 	=> 'goods.destroy'
    ],
    'goods_salf' => [
        'list' 		=> 'goods_salf.list',
//        'show'      =>'goods_salf.show',
        'sold' 	    => 'goods_salf.sold'
    ]
];