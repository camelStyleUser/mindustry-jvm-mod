
include 'jclass.inc'

format binary as 'class'

  u4 0xcafebabe 		; magic
  u2 0,49			; minor and major version

  constant_pool

	_Code			constant_utf8		'Code'
        _block			constant_utf8		'mindustry/world/Block'
        _myblock		constant_utf8		'TestBlock'
	_MyBlock		constant_class		_myblock
	_Block			constant_class		_block
	_init			constant_utf8		'<init>'
        _initContent		constant_utf8		'loadContent'
	_main			constant_utf8		'main'
	_log			constant_utf8		'arc/util/Log'
	_log_info		constant_utf8		'info'
	_void_arrstr		constant_utf8		'([Ljava/lang/String;)V'
	_void_object		constant_utf8		'(Ljava/lang/Object;)V'
	Test_class		constant_class		_Test
	_Test			constant_utf8		'Test'
	Block_init		constant_methodref	_MyBlock,init_method
	Object_init		constant_methodref	Object_class,init_method
	Object_class		constant_class		_Object
	_Object 		constant_utf8		'mindustry/mod/Mod'
	init_method		constant_nameandtype	_init,_void
	_void			constant_utf8		'()V'
	Log_class		constant_class		_log
	Log_info_method		constant_nameandtype	_log_info,_void_object
	Log_info		constant_methodref	Log_class,Log_info_method
	System.out		constant_fieldref	System_class,out_field
	System_class		constant_class		_System
	_System 		constant_utf8		'java/lang/System'
	out_field		constant_nameandtype	_out,PrintStream_type
	_out			constant_utf8		'out'
	PrintStream_type	constant_utf8		'Ljava/io/PrintStream;'
	PrintStream_println	constant_methodref	PrintStream_class,println_method
	PrintStream_class	constant_class		_PrintStream
	_PrintStream		constant_utf8		'java/io/PrintStream'
	println_method		constant_nameandtype	_println,_void_str
	_println		constant_utf8		'println'
	_void_str		constant_utf8		'(Ljava/lang/String;)V'

	Integer_toString	constant_methodref	Integer_class,toString_method
	Integer_class		constant_class		_Integer
	_Integer		constant_utf8		'java/lang/Integer'
	toString_method 	constant_nameandtype	_toString,_str_int
	_toString		constant_utf8		'toString'
	_str_int		constant_utf8		'(I)Ljava/lang/String;'
        _java_when_jvm_assembly_walks_in constant_utf8	'Java when JVM assembly walks in'
	_java_vs_jvm		constant_string		_java_when_jvm_assembly_walks_in
	Hello			constant_string 	_main		; re-use some existing UTF-8 sequences
	Hello_again		constant_string 	_void_arrstr	; for demonstration purposes
	number			constant_integer	1234

  end_constant_pool

  u2 ACC_PUBLIC+ACC_SUPER	; access flags
  u2 Test_class 		; this class
  u2 Object_class		; super class

  interfaces

  end_interfaces

  fields

  end_fields

  methods

     method_info ACC_PUBLIC, _init, _void				; public void Test()

       attribute _Code

	 u2 1 ; max_stack
	 u2 1 ; max_locals

	 bytecode

		aload 0
		invokespecial Object_init
		return

	 end_bytecode

	 exceptions
	 end_exceptions

	 attributes
	 end_attributes

       end_attribute

     end_method_info
     method_info ACC_PUBLIC,_initContent,_void
     attribute _Code
     u2 4
     u2 1
     bytecode
       ldc Log_class
       ldc _java_vs_jvm
       invokestatic Log_info
       new _MyBlock
       invokespecial Block_init
       return
     end_bytecode
     exceptions
     end_exceptions
     attributes
     end_attributes
     end_attribute
     end_method_info
     method_info ACC_PUBLIC+ACC_STATIC, _main, _void_arrstr		; public static void main(String[] args)

       attribute _Code

	 u2 3 ; max_stack
	 u2 1 ; max_locals

	 bytecode

		getstatic System.out		; load value of System.out on top of the stack
		dup				; duplicate, we are going to use it twice
		ldc Hello
		invokevirtual PrintStream_println
		ldc Hello_again
		invokevirtual PrintStream_println
                getstatic System.out
                ldc number
                invokestatic Integer_toString
                invokevirtual PrintStream_println
		return

	 end_bytecode

	 exceptions
	 end_exceptions

	 attributes
	 end_attributes

       end_attribute

     end_method_info

  end_methods

  attributes

  end_attributes
